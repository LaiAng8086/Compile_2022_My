define dso_local i32 @main() {
  %1 = alloca i32 
  %2 = alloca i32 
  store i32 0, i32* %1 
  %3 = call i32 (...) @getint()
  store i32 %3, i32* %2 
  %4 = load i32, i32* %2 
  %5 = add nsw i32 %4, 4
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @putint to i32 (i32, ...)*)(i32 %5)
  ret i32 0
}

declare dso_local i32 @getint(...) #1

declare dso_local i32 @putint(...) #1
