.class Lcom/android/internal/backup/IObbBackupService$Stub$Proxy;
.super Ljava/lang/Object;
.source "IObbBackupService.java"

# interfaces
.implements Lcom/android/internal/backup/IObbBackupService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/backup/IObbBackupService$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .locals 0
    .parameter "remote"

    .prologue
    .line 110
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 111
    iput-object p1, p0, Lcom/android/internal/backup/IObbBackupService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 112
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/android/internal/backup/IObbBackupService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public backupObbs(Ljava/lang/String;Landroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;)V
    .locals 5
    .parameter "packageName"
    .parameter "data"
    .parameter "token"
    .parameter "callbackBinder"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 126
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 128
    .local v0, _data:Landroid/os/Parcel;
    :try_start_0
    const-string v2, "com.android.internal.backup.IObbBackupService"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 129
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 130
    if-eqz p2, :cond_1

    .line 131
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 132
    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    .line 137
    :goto_0
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 138
    if-eqz p4, :cond_0

    invoke-interface {p4}, Landroid/app/backup/IBackupManager;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    :cond_0
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 139
    iget-object v1, p0, Lcom/android/internal/backup/IObbBackupService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 144
    return-void

    .line 135
    :cond_1
    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 142
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    const-string v0, "com.android.internal.backup.IObbBackupService"

    return-object v0
.end method

.method public restoreObbFile(Ljava/lang/String;Landroid/os/ParcelFileDescriptor;JILjava/lang/String;JJILandroid/app/backup/IBackupManager;)V
    .locals 7
    .parameter "pkgName"
    .parameter "data"
    .parameter "fileSize"
    .parameter "type"
    .parameter "path"
    .parameter "mode"
    .parameter "mtime"
    .parameter "token"
    .parameter "callbackBinder"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 152
    .local v2, _data:Landroid/os/Parcel;
    :try_start_0
    const-string v3, "com.android.internal.backup.IObbBackupService"

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 153
    invoke-virtual {v2, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 154
    if-eqz p2, :cond_0

    .line 155
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 156
    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    .line 161
    :goto_0
    invoke-virtual {v2, p3, p4}, Landroid/os/Parcel;->writeLong(J)V

    .line 162
    invoke-virtual {v2, p5}, Landroid/os/Parcel;->writeInt(I)V

    .line 163
    invoke-virtual {v2, p6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v2, p7, p8}, Landroid/os/Parcel;->writeLong(J)V

    .line 165
    move-wide/from16 v0, p9

    invoke-virtual {v2, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 166
    move/from16 v0, p11

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 167
    if-eqz p12, :cond_1

    invoke-interface/range {p12 .. p12}, Landroid/app/backup/IBackupManager;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    :goto_1
    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 168
    iget-object v3, p0, Lcom/android/internal/backup/IObbBackupService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-interface {v3, v4, v2, v5, v6}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 173
    return-void

    .line 159
    :cond_0
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 171
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    throw v3

    .line 167
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method
