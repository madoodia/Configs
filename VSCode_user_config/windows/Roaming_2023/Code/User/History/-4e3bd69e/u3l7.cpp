// (C) 2022 madoodia.com
// All Rights Reserved.

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
	if (ActorClassToSpawn && GetOwner())
	{
		FTransform OwnerTransform = GetOwner()->GetTransform();
		FVector CurrentLocation = OwnerTransform.GetLocation();
		CurrentLocation.Z += 500.0f;
		OwnerTransform.SetLocation(CurrentLocation);

		GetWorld()->SpawnActor<AActor>(ActorClassToSpawn, OwnerTransform);
	}
}
