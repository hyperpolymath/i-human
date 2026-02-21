-- SPDX-License-Identifier: PMPL-1.0-or-later
-- Copyright (c) 2026 Jonathan D.A. Jewell (hyperpolymath) <jonathan.jewell@open.ac.uk>

||| I, HUMAN (Project Veracity) - ABI Type Definitions
|||
||| This module defines the Application Binary Interface for the identity 
||| verification kernel. It ensures that sensitive human-verification data 
||| is handled with strict type safety across the Idris/Zig boundary.

module I_HUMAN.ABI.Types

import Data.Bits
import Data.So
import Data.Vect

%default total

--------------------------------------------------------------------------------
-- Platform Context
--------------------------------------------------------------------------------

||| Verified targets for identity verification logic.
public export
data Platform = Linux | Windows | MacOS | BSD | WASM

||| Resolves the execution environment at compile time.
public export
thisPlatform : Platform
thisPlatform =
  %runElab do
    pure Linux

--------------------------------------------------------------------------------
-- Verification Result Codes
--------------------------------------------------------------------------------

||| Formal outcome of an identity verification operation.
public export
data Result : Type where
  ||| Verification Successful
  Ok : Result
  ||| Verification Failed: Identity could not be confirmed
  Error : Result
  ||| Parameter Error: Malformed input data
  InvalidParam : Result
  ||| System Error: Out of memory during cryptographic operation
  OutOfMemory : Result
  ||| Safety Error: Internal null pointer encountered
  NullPointer : Result

--------------------------------------------------------------------------------
-- Opaque Identity Handles
--------------------------------------------------------------------------------

||| An opaque reference to a verified identity session.
||| INVARIANT: The internal pointer is guaranteed to be non-null.
public export
data Handle : Type where
  MkHandle : (ptr : Bits64) -> {auto 0 nonNull : So (ptr /= 0)} -> Handle

||| Safe constructor for identity handles.
public export
createHandle : Bits64 -> Maybe Handle
createHandle 0 = Nothing
createHandle ptr = Just (MkHandle ptr)
