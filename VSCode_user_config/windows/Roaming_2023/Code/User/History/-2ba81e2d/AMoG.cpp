// Fill out your copyright notice in the Description page of Project Settings.

#include "RngWidget.h"

#include "Components/Button.h"
#include "Components/TextBlock.h"
#include "Math.h"

void URngWidget::GenerateRandom()
{
    int32 RandomNmber = FMath::RandRange(0, 100);
    RandomNumberLabel->SetText(FText::AsNumber(RandomNmber));
}

void URngWidget::NativeConstruct()
{
    Super::NativeConstruct();
    GenerateRandom();

    GenerateButton->OnClicked.AddUniqueDynamic(this, &URngWidget::OnGenerateButtonClicked);
}

void URngWidget::OnGenerateButtonClicked()
{
    GenerateRandom();
}