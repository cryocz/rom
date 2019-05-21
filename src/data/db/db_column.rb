module ROM
	class DbColumn
		def table
			@tab
		end

		def name
			@name
		end

		def type
			@type
		end
		
		def mapping
			@map
		end
		
		def attributes
			@att
		end
		
		def reference
			@ref
		end
		
		def reference=(ref)
			@ref = ref
		end

		def initialize(tab, nm, tp, map, *att)
			@tab = tab
			@name = nm
			@type = tp
			@map = map
			@att = att
		end
	end
end