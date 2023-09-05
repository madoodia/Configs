// (C) 2022 madoodia.com\nAll Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "Engine/DataAsset.h"
#include "SMState.generated.h"

UENUM()
enum class EStateMachineCompletionType : uint8
{
	// Implicit failure - this state is not maked as Accept.
	NotAccepted,
	// Success - this state is an Accept state.
	Accepted,
	// Explicit failure - this state is specifically marked as failure/not-accept.
	Rejected,
	// Our simulation ran out of steps while the machine was still running.
	OutOfSteps UMETA(Hidden)
};

USTRUCT()
struct STATEMACHINE_API FStateMachineResult
{
	GENERATED_BODY()

	UPROPERTY()
	EStateMachineCompletionType CompletionType;

	UPROPERTY()
	USMState* FinalState;

	UPROPERTY()
	int32 DataIndex;
};

UCLASS()
class STATEMACHINE_API USMInputAtom : public UDataAsset
{
	GENERATED_BODY()

public: // Display value for this input atom, mainly for debugging purposes
	UPROPERTY(EditAnywhere)
	FName Description;
};

UCLASS(EditInlineNew)
class STATEMACHINE_API USM_Branch : public UDataAsset
{
	GENERATED_BODY()

public:
	/** Return DestinationState on success, Null on failure.
	For subclasses, OutDataIndex might be something other than 1, if a branch is made to consume multiple inputs. */
	virtual USMState* TryBranch(const UObject* RefObject,
								const TArray<USMInputAtom*>& dataSource,
								int32 DataIndex, int32& OutDataIndex);

protected:
	// State where we will go next if this branch is taken. If null, this branch will be ignored.
	UPROPERTY(EditAnywhere)
	USMState* DestinationState;

	// If true, the meaning of AcceptableInputs is reversed.
	UPROPERTY(EditAnywhere)
	uint32 bReverseInputTest : 1;

	// Acceptable inputs. The current input atom must be on this list.
	UPROPERTY(EditAnywhere)
	TArray<USMInputAtom*> AcceptableInputs;
};

/**
 *
 */
UCLASS()
class STATEMACHINE_API USMState : public UDataAsset
{
	GENERATED_BODY()

public:
	USMState();

	/** Attemp to run the state with input from the given DataSource object.
	Will start reading input at DataIndex.
	Will decrement RemainingSteps and automatically fail after it hits 0. */
	UFUNCTION(BlueprintCallable, Category = "State Machine")
	virtual FStateMachineResult RunState(const UObject* RefObject,
										 const TArray<USMInputAtom*>& DataSource,
										 int32 DataIndex = 0, int32 RemainingSteps = -1);

protected:
	// Loop. Used when input atom being processed isn't recognized.
	virtual FStateMachineResult LoopState(const UObject* RefObject,
										const TArray<USMInputAtom*>)& DataSource,
										int32 DataIndex, int32 RemainingSteps);
	/** If input runs out on this state (or TerminateImmediately is true),
	this is how the result will be interpreted. */
	UPROPERTY(EditAnywhere)
	EStateMachineCompletionType CompletionType;

	/** A state machine run that enters this state will terminate immediately,
	regardless of weather or not there is more input data. */
	UPROPERTY(EditAnywhere)
	uint32 bTerminateImmediately : 1;
};
