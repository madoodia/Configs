// (C) 2022 madoodia.com\nAll Rights Reserved.

#include "SMState.h"

USMState::USMState()
	: bLoopByDefalt{true}
{
}

FStateMachineResult USMState::RunState(const UObject* RefObject,
									   const TArray<USMInputAtom*>& DataSource,
									   int32 DataIndex,
									   int32 RemainingSteps)
{
	return FStateMachineResult();
}

FStateMachineResult USMState::LoopState(const UObject* RefObject,
										const TArray<USMInputAtom*>& DataSource,
										int32 DataIndex,
										int32 RemainingSteps)
{
	return FStateMachineResult();
}

USMState* USMBranch::TryBranch(const UObject* RefObject,
							   const TArray<USMInputAtom*>& DataSource,
							   int32 DataIndex,
							   int32& OutDataIndex)
{
	OutDataIndex = DataIndex;
	if (!AcceptableInputs.Num() ||
		(DataSource.IsValidIndex(DataIndex)) &&
			AcceptableInputs.Contains(DataSource[DataIndex]))
	{
		++OutDataIndex;
		return bReverseInputTest ? nullptr : DestinationState;
	}
	return bReverseInputTest ? DestinationState : nullptr;
}
