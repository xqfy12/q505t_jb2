.class Landroid/media/MediaRouter$CallbackInfo;
.super Ljava/lang/Object;
.source "MediaRouter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/MediaRouter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CallbackInfo"
.end annotation


# instance fields
.field public final cb:Landroid/media/MediaRouter$Callback;

.field public flags:I

.field public final router:Landroid/media/MediaRouter;

.field public type:I


# direct methods
.method public constructor <init>(Landroid/media/MediaRouter$Callback;IILandroid/media/MediaRouter;)V
    .locals 0
    .parameter "cb"
    .parameter "type"
    .parameter "flags"
    .parameter "router"

    .prologue
    .line 2065
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2066
    iput-object p1, p0, Landroid/media/MediaRouter$CallbackInfo;->cb:Landroid/media/MediaRouter$Callback;

    .line 2067
    iput p2, p0, Landroid/media/MediaRouter$CallbackInfo;->type:I

    .line 2068
    iput p3, p0, Landroid/media/MediaRouter$CallbackInfo;->flags:I

    .line 2069
    iput-object p4, p0, Landroid/media/MediaRouter$CallbackInfo;->router:Landroid/media/MediaRouter;

    .line 2070
    return-void
.end method


# virtual methods
.method public filterRouteEvent(Landroid/media/MediaRouter$RouteInfo;)Z
    .locals 2
    .parameter "route"

    .prologue
    .line 2073
    iget v0, p0, Landroid/media/MediaRouter$CallbackInfo;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    iget v0, p0, Landroid/media/MediaRouter$CallbackInfo;->type:I

    iget v1, p1, Landroid/media/MediaRouter$RouteInfo;->mSupportedTypes:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
