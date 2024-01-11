module Benchmark.Util(initTracer, stopTracer, executeWithShell) where

import System.Process

initTracer :: FilePath -> FilePath -> IO ()
initTracer scriptPath mountPoint = executeWithShell $ scriptPath ++ "/init.sh " ++ show mountPoint

stopTracer :: FilePath -> IO ()
stopTracer scriptPath = executeWithShell $ scriptPath ++ "/stop.sh"

executeWithShell :: String -> IO ()
executeWithShell command = do
  (_, _, _, processHandle) <- createProcess (shell ("/bin/bash -c " ++ show command))
  _ <- waitForProcess processHandle
  return ()
