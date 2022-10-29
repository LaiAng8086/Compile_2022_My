define dso_local i32 @main() #0 {
  %1 = alloca i32 
  %2 = alloca i32 
  store i32 0, i32* %1 
  store i32 1, i32* %2 
  %3 = load i32, i32* %2 
  ret i32 %3
}