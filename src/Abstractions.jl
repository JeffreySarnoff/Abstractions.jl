module Abstractions
import Base.Dates: AbstractTime, TimeType

abstract type AbstractPlace    end

abstract type AbstractSequence end
abstract type AbstractMultiSequence <: AbstractSequence end

abstract type AbstractSeries   end
abstract type AbstractMultiSeries <: AbstractSeries   end

import TimeSeries: AbstractTimeSeries
abstract type AbstractMultiTimeSeries <: AbstractTimeSeries end

export AbstractPlace,    AbstractTime, 
       AbstractSequence, AbstractMultiSequence,
       AbsractTimeSeries, AbsractTimeMultiSeries


export 
    SysFloat, SysInt,   SysUInt,
    Machloat, MachInt,  MachUInt,
    FastFloat, FastInt, FastUInt

const SysFloat = Union{Float64, Float32}
const SysInt   = Union{Int64, Int32}
const SysUInt  = Union{UInt64, UInt32}

const MachFloat = Union{Float64, Float32}
const MachInt   = Union{Int64, Int32, Int16, Int8}
const MachUInt  = Union{UInt64, UInt32, UInt16, UInt8}

const FastFloat = Float32
const FastInt   = Int32
const FastUInt  = UInt32



abstract type AbstractSequence end

abstract type AbstractOrder end
abstract type PartialOrder <: AbstractOrder end
abstract type LatticeOrder <: PartialOrder  end
abstract type TotalOrder   <: LatticeOrder  end



export Abstraction,
    AnyVec, AnyMat, AnyArray,
    AbstractTime, AbstractTimeSeries,
    AnyTimeVec, AnyTimeMat, AnyTimeArray,
    AnyNumeriVec, AnyNumericArray,
    AnyRealVec, AnyRealArray, 
    AnyFloatVec, AnyFloatArray, 
    SysFloat, SysInt, SysUInt

#       AbstractTime, AbstractSpace, AbstractInterval,
#       AbstractMeasure, AbstractValue, AbstractOperator

abstract type Abstraction end

abstract type AbstractType <: Abstraction end
abstract type AbstractKind <: Abstraction end

abstract type AbstractQuality  <: Abstraction end
abstract type AbstractQuantity <: Abstraction end

abstract type AbstractNeighborhood <: Abstraction end
abstract type AbstractRelationship <: Abstraction end

abstract type AbstractConnection <: Abstraction end
abstract type AbstractDirection  <: Abstraction end


abstract type AbstractTime <: Abstraction end

const AnyTimeVec = AbstractVector{T} where T<:TimeType
const AnyNumericVec = AbstractVector{T} where T<:Number
const AnyRealVec = AbstractVector{T} where T<:Real
const AnyFloatVec = AbstractVector{T} where T<:AbstractFloat

const AnyArray = AbstractArray{T,N} where T where N

const AnyTimeArray  = AbstractArray{T,N} where T<:TimeType where N
const AnyNumericArray  = AbstractArray{T,N} where T<:Numeric where N
const AnyRealArray  = AbstractArray{T,N} where T<:Real where N
const AnyFloatArray = AbstractArray{T,N} where T<:AbstractFloat where N

const AnyTimeSeq = Union{AnyTimeVec, StepRange{P,Q}} where P<:TimeType where Q


end # module
