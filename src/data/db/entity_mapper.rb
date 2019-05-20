# Created by Matyáš Pokorný on 2019-05-19.

module ROM
	class EntityMapper
		def initialize(tab, lazy)
			@tab = tab
			@lazy = lazy
		end
		
		def map_all(res)
			ret = []
			res.each { |row| ret << map(row) }
			
			ret
		end
		
		def map(row)
			vals = {}
			@tab.columns.each do |col|
				val = row[col.name]
				vals[col.mapping.name.to_sym] = (col.mapping.type <= Model ? lazy[col.table].fetch({ col => val }) : val)
			end
			
			Entity.new(@tab, vals)
		end
	end
end