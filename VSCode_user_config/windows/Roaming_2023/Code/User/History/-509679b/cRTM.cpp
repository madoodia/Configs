// (C) 2022 madoodia.com\nAll Rights Reserved.

#include "FirstActor.h"

// Sets default values
AFirstActor::AFirstActor()
{
	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = false;
}

// Called when the game starts or when spawned
void AFirstActor::BeginPlay()
{
	Super::BeginPlay();
}
