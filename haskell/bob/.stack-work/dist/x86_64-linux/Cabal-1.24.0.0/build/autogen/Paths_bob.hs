{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_bob (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/tyler/exercism/haskell/bob/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/bin"
libdir     = "/home/tyler/exercism/haskell/bob/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/lib/x86_64-linux-ghc-8.0.1/bob-0.0.0-BCU7vJHL3pzHFeT8eFajbr"
datadir    = "/home/tyler/exercism/haskell/bob/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/share/x86_64-linux-ghc-8.0.1/bob-0.0.0"
libexecdir = "/home/tyler/exercism/haskell/bob/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/libexec"
sysconfdir = "/home/tyler/exercism/haskell/bob/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bob_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bob_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "bob_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bob_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bob_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)