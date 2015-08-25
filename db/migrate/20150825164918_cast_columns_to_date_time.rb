class CastColumnsToDateTime < ActiveRecord::Migration
      def change
	change_column :reservations, :time_to, 'datetime USING CAST(time_to AS datetime)'
	change_column :reservations, :time_from, 'datetime USING CAST(time_from AS datetime)'
  end
end
