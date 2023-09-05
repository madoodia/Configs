// (C) 2022 madoodia.com\nAll Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "FirstActor.generated.h"

UCLASS(ClassGroup = (Custom), meta = (BlueprintSpawnableComponent))
class BLANK_API UFirstActor : public UActorCom
{
	GENERATED_BODY()

public:
	AFirstActor();

protected:
	UPRO

			virtual void
			BeginPlay() override;

public:
	void ActorAboveMe();
};
