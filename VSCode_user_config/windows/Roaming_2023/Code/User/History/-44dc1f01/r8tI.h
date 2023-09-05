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
	USM_State* FinalState;

	UPROPERTY()
	int32 DataIndex;
};

UCLASS()
class STATEMACHINE_API USM_InputAtom : public UDataAsset
{
	GENERATED_BODY()

public: // Display value for this input atom, mainly for debugging purposes
	UPROPERTY(EditAnywhere)
	FName Description;
};

UCLASS(EditInlineNew)
class USM_Branch : public UDataAsset
{
	GENERATED_BODY()

public:
	/** Return DestinationState on success, Null on failure.
	For subclasses, OutDataIndex might be something other than 1, if a branch is made to consume multiple inputs. */
	virtual USM_State* TryBranch(const UObject* RefObject,
								 const TArray<USM_InputAtom*>& dataSource,
								 int32 DataIndex, int32& OutDataIndex);

protected:
	// State where we will go next if this branch is taken. If null, this branch will be ignored.
	UPROPERTY(EditAnywhere)
	USM_State* DestinationState;

	// If true, the meaning of AcceptableInputs is reversed.
	UPROPERTY(EditAnywhere)
	uint32 bReverseInputTest = 1;

	// Acceptable inputs. The current input atom must be on this list.
	UPROPERTY(EditAnywhere)
	TArray<USM_InputAtom*> AcceptableInputs;
};

/**
 *
 */
UCLASS()
class STATEMACHINE_API USM_State : public UDataAsset
{
	GENERATED_BODY()

public:
};
