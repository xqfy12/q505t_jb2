.class abstract Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;
.super Ljava/lang/Thread;
.source "KeyguardSimPinView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "CheckSimPin"
.end annotation


# instance fields
.field private final mPin:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;


# direct methods
.method protected constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "pin"

    .prologue
    .line 163
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 164
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;->mPin:Ljava/lang/String;

    .line 165
    return-void
.end method


# virtual methods
.method abstract onSimCheckResponse(I)V
.end method

.method public run()V
    .locals 4

    .prologue
    .line 172
    :try_start_0
    const-string v2, "phone"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;->mPin:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/android/internal/telephony/ITelephony;->supplyPinReportResult(Ljava/lang/String;)I

    move-result v1

    .line 174
    .local v1, result:I
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    new-instance v3, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin$1;

    invoke-direct {v3, p0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin$1;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;I)V

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    .end local v1           #result:I
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, e:Landroid/os/RemoteException;
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    new-instance v3, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin$2;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin$2;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$CheckSimPin;)V

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
