inherits
inherits
	^ super inherits
		==> [ :p | 
			self flag: #todo.	"Handle p third as a type filter. Not sure how that works"
			OTPDiaInheritToken new
				moduleName: p second;
				parsed: (self parse: (moduleSet at: p second) contents) ]