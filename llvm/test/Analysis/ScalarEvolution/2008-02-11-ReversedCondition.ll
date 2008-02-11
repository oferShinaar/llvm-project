; RUN: llvm-as < %s | opt -scalar-evolution -analyze | not grep Unpredictable

define void @foo(i32 %n) {
entry:
	br label %header
header:
	%i = phi i32 [ 0, %entry ], [ %i.inc, %next ]
	%cond = icmp sgt i32 %n, %i
	br i1 %cond, label %next, label %return
next:
        %i.inc = add i32 %i, 1
	br label %header
return:
	ret void
}
