// (C) 2022 madoodia.com\nAll Rights Reserved.

#include "SMState.h"

USMState::USMState()
	: bLoopByDefalt{0}
{
}

FStateMachineResult USMState::RunState(const UObject* RefObject, const TArray<USMInputAtom*>& DataSource, int32 DataIndex, int32 RemainingSteps)
{
	return FStateMachineResult();
}

FStateMachineResult USMState::LoopState(const UObject* RefObject, const TArray<USMInputAtom*>& DataSource, int32 DataIndex, int32 RemainingSteps)
{
	return FStateMachineResult();
}
