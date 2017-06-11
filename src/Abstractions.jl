module Abstractions

using Base.Dates
import Base.Dates: TimeType
import TimeSeries: AbstractTimeSeries

export Abstraction,
    AnyVec, AnyArray,
    AbstractTime, AbstractTimeSeries,
    AnyTimeVec, AnyTimeArray,
    AnyNumericVec, AnyNumericArray,
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

const SysFloat = Union{Float64, Float32}
const SysInt   = Union{Int64, Int32}
const SysUInt  = Union{UInt64, UInt32}

const AnyVec    = AbstractVector{T} where T
const StringVec = AbstractVector{T} where T<:String
const NumberVec = AbstractVector{T} where T<:Number
const RealVec   = AbstractVector{T} where T<:Real
const FloatVec  = AbstractVector{T} where T<:AbstractFloat

const AnyMat    = AbstractMatrix{T} where T
const StringMat = AbstractMatrix{T} where T<:String
const NumberMat = AbstractMatrix{T} where T<:Number
const RealMat   = AbstractMatrix{T} where T<:Real
const FloatMat  = AbstractMatrix{T} where T<:AbstractFloat

const AnyArray    = AbstractArray{T,N} where T where T
const StringArray = AbstractArray{T,N} where T<:String where T
const NumberArray = AbstractArray{T,N} where T<:Number where T
const RealArray   = AbstractArray{T,N} where T<:Real where T
const FloatArray  = AbstractArray{T,N} where T<:AbstractFloat where T


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
