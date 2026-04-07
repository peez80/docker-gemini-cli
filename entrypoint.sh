#!/bin/bash
# Wenn DEBUG auf "true" gesetzt ist, führe den Befehl normal aus.
# Ansonsten leite Fehlermeldungen (stderr) nach /dev/null um.
if [ "$CLI_INCLUDE_STDERR" = "true" ]; then
    # 'exec' sorgt dafür, dass die CLI der Hauptprozess (PID 1) wird
    exec gemini "$@"
else
    exec gemini "$@" 2>/dev/null
fi
