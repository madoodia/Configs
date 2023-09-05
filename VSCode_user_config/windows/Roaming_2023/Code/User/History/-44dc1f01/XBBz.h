// (C) 2022 madoodia.com\nAll Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "Engine/DataAsset.h"
#include "SMState.generated.h"

UENUM()
enum class EStateMachineCompetionType : uint8
{
	NotAccepted,
	Accepted,
	Rejected,
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
