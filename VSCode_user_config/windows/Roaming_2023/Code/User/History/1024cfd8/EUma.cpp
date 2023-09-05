// Fill out your copyright notice in the Description page of Project Settings.

#include "Wolf.h"

// Sets default values
AWolf::AWolf(const FObjectInitializer &ObjectInitializer)
{
	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	HealthWidgetComponent = ObjectInitializer.CreateDefaultSubobject();
}

// Called when the game starts or when spawned
void AWolf::BeginPlay()
{
	Super::BeginPlay();
}

// Called every frame
void AWolf::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}
