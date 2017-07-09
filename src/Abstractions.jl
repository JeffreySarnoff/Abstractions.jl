__precompile__()

module Abstractions

export 
    SysFloat, SysInt,   SysUInt,
    Machloat, MachInt,  MachUInt,
    FastFloat, FastInt, FastUInt

export AnyInteger,
       AbsVector,   AbsMatrix,   AbsArray,
       NumVector,   NumMatrix,   NumArray,
       RealVector,  RealMatrix,  RealArray,
       FloatVector, FloatMatrix, FloatArray,
       IntVector,   IntMatrix,   IntArray,
       TimeVector,  TimeMatrix,  TimeArray

export AbstractPlace,    AbstractTime, 
       AbstractSequence, AbstractMultiSequence,
       AbsractTimeSeries, AbsractTimeMultiSeries


const SysFloat = Union{Float64, Float32}
const SysInt   = Union{Int64, Int32}
const SysUInt  = Union{UInt64, UInt32}

const MachFloat = Union{Float64, Float32}
const MachInt   = Union{Int64, Int32, Int16, Int8}
const MachUInt  = Union{UInt64, UInt32, UInt16, UInt8}

const FastFloat = Float32
const FastInt   = Int32
const FastUInt  = UInt32
       

import Base.Dates: AbstractTime, TimeType
import TimeSeries: AbstractTimeSeries

const AnyInteger  = Union{Signed, Unsigned}

const AbsVector   = AbstractVector{T}  where T
const AbsMatrix   = AbstractMatrix{T}  where T
const AbsArray    = AbstractArray{T,N} where T where N

const NumVector   = AbstractVector{T}  where T<:Number
const NumMatrix   = AbstractMatrix{T}  where T<:Number
const NumArray    = AbstractArray{T,N} where T<:Number where N

const RealVector  = AbstractVector{T}  where T<:Real
const RealMatrix  = AbstractMatrix{T}  where T<:Real
const RealArray   = AbstractArray{T,N} where T<:Real where N

const FloatVector = AbstractVector{T}  where T<:AbstractFloat
const FloatMatrix = AbstractMatrix{T}  where T<:AbstractFloat
const FloatArray  = AbstractArray{T,N} where T<:AbstractFloat where N

const IntVector   = AbstractVector{T}  where T<:AnyInteger
const IntMatrix   = AbstractMatrix{T}  where T<:AnyInteger
const IntArray    = AbstractArray{T,N} where T<:AnyInteger where N

const TimeVector  = AbstractVector{T}  where T<:AbstractTime
const TimeMatrix  = AbstractMatrix{T}  where T<:AbstractTime
const TimeArray   = AbstractArray{T,N} where T<:AbstractTime where N


abstract type AbstractPlace    end

abstract type AbstractSequence end
abstract type AbstractMultiSequence <: AbstractSequence end

abstract type AbstractSeries   end
abstract type AbstractMultiSeries <: AbstractSeries   end

abstract type AbstractMultiTimeSeries <: AbstractTimeSeries end


abstract type AbstractSequence end

abstract type AbstractOrder end
abstract type PartialOrder <: AbstractOrder end
abstract type LatticeOrder <: PartialOrder  end
abstract type TotalOrder   <: LatticeOrder  end



export Abstraction,
    AnyVec, AnyMat, AnyArray,
    AnyTimeVec, AnyTimeMat, AnyTimeArray,
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

const AnyTimeVec = AbstractVector{T} where T<:TimeType
const AnyNumericVec = AbstractVector{T} where T<:Number

const AnyTimeSeq = Union{AnyTimeVec, StepRange{P,Q}} where P<:TimeType where Q


end # module
