module Houses

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export House

@kwdef mutable struct House <: AbstractModel
    id::DbId = DbId()
    street::String = "Random street"
    size::Float32 = 100.0
    rooms::Union{Int32,Nothing, Missing} = nothing
end

end
