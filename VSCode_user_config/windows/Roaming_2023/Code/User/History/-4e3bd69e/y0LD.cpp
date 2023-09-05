// (C) 2022 madoodia.com\nAll Rights Reserved.

#include "FirstActorComponent.h"

// Sets default values for this component's properties
UFirstActorComponent::UFirstActorComponent()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = false;

	// ...
}

// Called when the game starts
void UFirstActorComponent::BeginPlay()
{
	Super::BeginPlay();

	// ...
}

void UFirstActorComponent::ActorAboveMe()
{
	if (Actor)
}
