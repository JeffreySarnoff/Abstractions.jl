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
       AbstractTimeSeries, AbstractTimeMultiSeries

using Base.Dates
import Base.Dates:AbstractTime
import Base.TimeSeries: AbstractTimeSeries


const SysFloat = Union{Float64, Float32}
const SysInt   = Union{Int64, Int32}
const SysUInt  = Union{UInt64, UInt32}

const MachFloat = Union{Float64, Float32}
const MachInt   = Union{Int64, Int32, Int16, Int8}
const MachUInt  = Union{UInt64, UInt32, UInt16, UInt8}

const FastFloat = Float32
const FastInt   = Int32
const FastUInt  = UInt32

# from StatsBase.jl/common.jl
# common utilities

## convenient type alias
#
#  These types signficantly reduces the need of using
#  type parameters in functions (which are often just
#  for the purpose of restricting the arrays to real)
#
# These could be removed when the Base supports
# covariant type notation, i.e. AbstractVector{<:Real}
#

const RealArray{T<:Real,N} = AbstractArray{T,N}
const RealVector{T<:Real} = AbstractArray{T,1}
const RealMatrix{T<:Real} = AbstractArray{T,2}

const IntegerArray{T<:Integer,N} = AbstractArray{T,N}
const IntegerVector{T<:Integer} = AbstractArray{T,1}
const IntegerMatrix{T<:Integer} = AbstractArray{T,2}

const RealFP = Union{Float32, Float64}

## conversion from real to fp types

fptype{T<:Union{Float32,Bool,Int8,UInt8,Int16,UInt16}}(::Type{T}) = Float32
fptype{T<:Union{Float64,Int32,UInt32,Int64,UInt64,Int128,UInt128}}(::Type{T}) = Float64
fptype(::Type{Complex64}) = Complex64
fptype(::Type{Complex128}) = Complex128

# end from StatsBase

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
