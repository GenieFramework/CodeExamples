module CreateTableHouses

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
    create_table(:houses) do
        [
            pk()
            columns([
                :street => :string
                :size => :float
                :rooms => :int
            ])
        ]
    end

end

function down()
    drop_table(:houses)
end

end
