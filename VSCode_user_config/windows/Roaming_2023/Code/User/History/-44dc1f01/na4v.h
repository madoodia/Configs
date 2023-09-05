// (C) 2022 madoodia.com\nAll Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "Engine/DataAsset.h"
#include "SMState.generated.h"

UENUM()
enum class EStateMachineCompetionType : uint8
{
	// Implicit failure - this state is not maked as Accept.
	NotAccepted,
	// Success - this state is an Accept state.
	Accepted,
	// Explicit failure - this state is specifically marked as failure/not-accept.
	Rejected,
	//
	OutOfSteps UMETA(Hidden)
};

/**
 *
 */
UCLASS()
class STATEMACHINE_API USMState : public UDataAsset
{
	GENERATED_BODY()

public:
};
