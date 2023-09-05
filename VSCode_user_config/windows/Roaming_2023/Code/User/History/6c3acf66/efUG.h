// (C) 2022 madoodia.com\nAll Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "FirstActor.generated.h"

UCLASS()
class BLANK_API AFirstActor : public AActor
{
	GENERATED_BODY()

public:
	AFirstActor();

protected:
	virtual void BeginPlay() override;

public:
};
