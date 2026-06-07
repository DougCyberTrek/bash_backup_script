#! /bin/bash

# =============================================================================
# backup.sh — Backs up /home and ~/Documents to a local directory
# Creates a timestamped .tar.gz archive and logs the result
# =============================================================================
 
# --- Configuration ---
BACKUP_DEST="/backup"                      # Change this to your backup directory
LOG_FILE="$BACKUP_DEST/backup.log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"
SOURCES=("$HOME" "$HOME/Documents")       # Directories to back up
 
# --- Setup ---
mkdir -p "$BACKUP_DEST"
 
log() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1" | tee -a "$LOG_FILE"
}
 
log "===== Backup started ====="
log "Archive: $ARCHIVE_NAME"
log "Sources: ${SOURCES[*]}"
log "Destination: $BACKUP_DEST"
 
# --- Run backup ---
tar -czf "$BACKUP_DEST/$ARCHIVE_NAME" "${SOURCES[@]}" 2>> "$LOG_FILE"
 
if [[ $? -eq 0 ]]; then
    SIZE=$(du -sh "$BACKUP_DEST/$ARCHIVE_NAME" | cut -f1)
    log "SUCCESS — Archive size: $SIZE"
else
    log "ERROR — Backup failed. Check log for details."
    exit 1
fi
 
log "===== Backup complete ====="
 