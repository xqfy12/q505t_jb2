.class public Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;
.super Ljava/lang/Object;
.source "BaiduKeyguardManager.java"


# static fields
.field public static final BAIDU_KEYGUARD_DEFAULT_TYPE_KEY:Ljava/lang/String; = "sys.product_default_lock_mode"

.field public static final BAIDU_KEYGUARD_DISABLE_TYPE_KEY:Ljava/lang/String; = "sys.product_disable_lock_mode"

.field public static final BAIDU_KEYGUARD_TYPE_KEY:Ljava/lang/String; = "lockscreen.lockmode_type"

.field public static final LOCK_HOTWORD:I = 0x0

.field public static final LOCK_INVALID:I = -0x1

.field public static final LOCK_MULTITHEME:I = 0x2

.field public static final LOCK_SLIDE:I = 0x1

.field public static final LOCK_SPACE:I = 0xa

.field public static final LOCK_WATER:I = 0xb

.field private static MEMORY_THRESHOLD:I

.field private static TAG:Ljava/lang/String;

.field private static final sGPULockType:[I

.field private static sPrimaryDefaultType:I

.field private static sSecondaryDefaultType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-string v0, "BaiduKeyguardManager"

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->TAG:Ljava/lang/String;

    .line 45
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sGPULockType:[I

    .line 51
    const/16 v0, 0x300

    sput v0, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->MEMORY_THRESHOLD:I

    return-void

    .line 45
    nop

    :array_0
    .array-data 0x4
        0xat 0x0t 0x0t 0x0t
        0xbt 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static aboveCertainMemory()Z
    .locals 10

    .prologue
    const/4 v6, 0x1

    .line 135
    const-string v3, "/proc/meminfo"

    .line 136
    .local v3, path:Ljava/lang/String;
    const/4 v5, 0x0

    .line 138
    .local v5, totalMem:I
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 139
    .local v2, localFileReader:Ljava/io/FileReader;
    new-instance v1, Ljava/io/BufferedReader;

    const/16 v7, 0x2000

    invoke-direct {v1, v2, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 140
    .local v1, localBufferedReader:Ljava/io/BufferedReader;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 141
    .local v4, str:Ljava/lang/String;
    const-string v7, "\\s+"

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 142
    .local v0, arrayOfString:[Ljava/lang/String;
    const/4 v7, 0x1

    aget-object v7, v0, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    div-int/lit16 v5, v7, 0x400

    .line 143
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v0           #arrayOfString:[Ljava/lang/String;
    .end local v1           #localBufferedReader:Ljava/io/BufferedReader;
    .end local v2           #localFileReader:Ljava/io/FileReader;
    .end local v4           #str:Ljava/lang/String;
    :goto_0
    const-string v7, "BaiduKeyguardManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "total memory:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    sget v7, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->MEMORY_THRESHOLD:I

    if-le v5, v7, :cond_0

    :goto_1
    return v6

    :cond_0
    const/4 v6, 0x0

    goto :goto_1

    .line 144
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method public static createBaiduLockScreen(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)Landroid/view/View;
    .locals 3
    .parameter "context"
    .parameter "lockPatternUtils"
    .parameter "updateMonitor"
    .parameter "callback"

    .prologue
    .line 152
    const/4 v1, 0x0

    .line 153
    .local v1, view:Landroid/view/View;
    invoke-static {p0, p2}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->getLockMode(Landroid/content/Context;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;)I

    move-result v0

    .line 154
    .local v0, mode:I
    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    .line 155
    new-instance v1, Lcom/baidu/internal/keyguard/multitheme/MultithemeUnlockScreen;

    .end local v1           #view:Landroid/view/View;
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/baidu/internal/keyguard/multitheme/MultithemeUnlockScreen;-><init>(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V

    .line 167
    .restart local v1       #view:Landroid/view/View;
    :goto_0
    return-object v1

    .line 156
    :cond_0
    if-nez v0, :cond_1

    .line 157
    new-instance v1, Lcom/baidu/internal/keyguard/hotword/HotwordLockScreen;

    .end local v1           #view:Landroid/view/View;
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/baidu/internal/keyguard/hotword/HotwordLockScreen;-><init>(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V

    .restart local v1       #view:Landroid/view/View;
    goto :goto_0

    .line 158
    :cond_1
    const/4 v2, 0x1

    if-ne v2, v0, :cond_2

    .line 159
    new-instance v1, Lcom/baidu/internal/keyguard/slide/SlideLockScreen;

    .end local v1           #view:Landroid/view/View;
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/baidu/internal/keyguard/slide/SlideLockScreen;-><init>(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V

    .restart local v1       #view:Landroid/view/View;
    goto :goto_0

    .line 160
    :cond_2
    const/16 v2, 0xa

    if-ne v2, v0, :cond_3

    .line 161
    new-instance v1, Lcom/baidu/internal/keyguard/space/SpaceLockScreen;

    .end local v1           #view:Landroid/view/View;
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/baidu/internal/keyguard/space/SpaceLockScreen;-><init>(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V

    .restart local v1       #view:Landroid/view/View;
    goto :goto_0

    .line 162
    :cond_3
    const/16 v2, 0xb

    if-ne v2, v0, :cond_4

    .line 163
    new-instance v1, Lcom/baidu/internal/keyguard/water/WaterLockScreen;

    .end local v1           #view:Landroid/view/View;
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/baidu/internal/keyguard/water/WaterLockScreen;-><init>(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V

    .restart local v1       #view:Landroid/view/View;
    goto :goto_0

    .line 165
    :cond_4
    new-instance v1, Lcom/baidu/internal/keyguard/slide/SlideLockScreen;

    .end local v1           #view:Landroid/view/View;
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/baidu/internal/keyguard/slide/SlideLockScreen;-><init>(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V

    .restart local v1       #view:Landroid/view/View;
    goto :goto_0
.end method

.method public static getDefaultLockMode()J
    .locals 2

    .prologue
    .line 118
    const-string v0, "sys.product_default_lock_mode"

    const/4 v1, -0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public static getDisableLockMode()Ljava/lang/String;
    .locals 2

    .prologue
    .line 126
    const-string v0, "sys.product_disable_lock_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLockMode(Landroid/content/Context;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;)I
    .locals 8
    .parameter "context"
    .parameter "updateMonitor"

    .prologue
    .line 88
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->initDefaultLockMode()J

    move-result-wide v0

    .line 90
    .local v0, defaultmode:J
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "lockscreen.lockmode_type"

    invoke-static {v5, v6, v0, v1}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v3

    .line 92
    .local v3, mode:J
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->aboveCertainMemory()Z

    move-result v5

    if-nez v5, :cond_0

    .line 93
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    sget-object v5, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sGPULockType:[I

    array-length v5, v5

    if-ge v2, v5, :cond_0

    .line 94
    sget-object v5, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sGPULockType:[I

    aget v5, v5, v2

    int-to-long v5, v5

    cmp-long v5, v5, v3

    if-nez v5, :cond_1

    .line 95
    sget v5, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sSecondaryDefaultType:I

    int-to-long v3, v5

    .line 96
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "lockscreen.lockmode_type"

    invoke-static {v5, v6, v3, v4}, Landroid/provider/Settings$Secure;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 101
    .end local v2           #i:I
    :cond_0
    sget-object v5, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "lockscreen.lockmode_type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    const-wide/16 v5, 0x2

    cmp-long v5, v5, v3

    if-nez v5, :cond_2

    .line 104
    const/4 v5, 0x2

    .line 114
    :goto_1
    return v5

    .line 93
    .restart local v2       #i:I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 105
    .end local v2           #i:I
    :cond_2
    const-wide/16 v5, 0x0

    cmp-long v5, v5, v3

    if-nez v5, :cond_3

    .line 106
    const/4 v5, 0x0

    goto :goto_1

    .line 107
    :cond_3
    const-wide/16 v5, 0x1

    cmp-long v5, v5, v3

    if-nez v5, :cond_4

    .line 108
    const/4 v5, 0x1

    goto :goto_1

    .line 109
    :cond_4
    const-wide/16 v5, 0xa

    cmp-long v5, v5, v3

    if-nez v5, :cond_5

    .line 110
    const/16 v5, 0xa

    goto :goto_1

    .line 111
    :cond_5
    const-wide/16 v5, 0xb

    cmp-long v5, v5, v3

    if-nez v5, :cond_6

    .line 112
    const/16 v5, 0xb

    goto :goto_1

    .line 114
    :cond_6
    sget v5, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sSecondaryDefaultType:I

    goto :goto_1
.end method

.method public static initDefaultLockMode()J
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 64
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->getDefaultLockMode()J

    move-result-wide v0

    .line 65
    .local v0, mode:J
    sget-object v2, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sys.product_default_lock_mode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->getDisableLockMode()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 67
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-eq v2, v3, :cond_1

    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->aboveCertainMemory()Z

    move-result v2

    if-nez v2, :cond_3

    .line 68
    :cond_1
    sput v5, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sPrimaryDefaultType:I

    .line 69
    sget-object v2, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sGPULockType:[I

    invoke-static {v2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "[\\[\\]\\ ]"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->setDisableLockMode(Ljava/lang/String;)V

    .line 73
    :goto_0
    sput v5, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sSecondaryDefaultType:I

    .line 74
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->aboveCertainMemory()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 75
    sget v2, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sPrimaryDefaultType:I

    int-to-long v0, v2

    .line 76
    sget-object v2, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sys.product_default_lock_mode aboveCertainMemory "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    :goto_1
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->setDefaultLockMode(J)V

    .line 83
    :cond_2
    return-wide v0

    .line 71
    :cond_3
    const/16 v2, 0xa

    sput v2, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sPrimaryDefaultType:I

    goto :goto_0

    .line 78
    :cond_4
    sget v2, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->sSecondaryDefaultType:I

    int-to-long v0, v2

    .line 79
    sget-object v2, Lcom/android/internal/policy/impl/keyguard/BaiduKeyguardManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sys.product_default_lock_mode"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static setDefaultLockMode(J)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 122
    const-string v0, "sys.product_default_lock_mode"

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public static setDisableLockMode(Ljava/lang/String;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 130
    const-string v0, "sys.product_disable_lock_mode"

    invoke-static {v0, p0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    return-void
.end method
