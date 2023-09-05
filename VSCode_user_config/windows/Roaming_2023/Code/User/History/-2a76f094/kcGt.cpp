/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

// create an unreal engine 5 Bluprint Function Library class
class UMyLibrary : public UBlueprintFunctionLibrary
{
  GENERATED_BODY()

public:
  // create a static function that returns a string
  UFUNCTION(BlueprintCallable, Category = "MyLibrary")
  static FString GetMyString();
};
