module Abstractions

using Base.Dates
import Base.Dates: TimeType
import TimeSeries: AbstractTimeSeries

export Abstraction,
    AnyVec, AnyArray,
    AbstractTimeType, AbstractTimeSeries,
    AnyTimeVec, AnyTimeArray,
    AnyNumericVec, AnyNumericArray,
    AnyRealVec, AnyRealArray, 
    AnyFloatVec, AnyFloatArray, 
    SysFloat, SysInt, SysUInt

#       AbstractTime, AbstractSpace, AbstractInterval,
#       AbstractMeasure, AbstractValue, AbstractOperator

abstract type Abstraction end

const SysFloat = Union{Float64, Float32}
const SysInt   = Union{Int64, Int32}
const SysUInt  = Union{UInt64, UInt32}

const AnyVec = AbstractVector{T} where T

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
