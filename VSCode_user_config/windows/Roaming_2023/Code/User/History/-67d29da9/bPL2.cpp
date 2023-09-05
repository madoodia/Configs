// (C) 2022 madoodia.com\nAll Rights Reserved.

#include "SMState.h"

USMState::USMState()
	: bLoopByDefalt{true}
{
}

FStateMachineResult USMState::RunState(const UObject* RefObject,
									   const TArray<USMInputAtom*>& DataSource,
									   int32 DataIndex /*= 0*/,
									   int32 RemainingSteps /*= -1*/)
{
	bool bMustEndNow = (bTerminateImmediately || !DataSource.IsValidIndex(DataIndex));
	// If we're still running, see where our branches lead.
	if (RemainingSteps && !bMustEndNow)
	{
	}
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
