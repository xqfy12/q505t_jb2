.class Landroid/media/MediaRouter$VolumeCallbackInfo;
.super Ljava/lang/Object;
.source "MediaRouter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/MediaRouter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "VolumeCallbackInfo"
.end annotation


# instance fields
.field public final route:Landroid/media/MediaRouter$RouteInfo;

.field public final vcb:Landroid/media/MediaRouter$VolumeCallback;


# direct methods
.method public constructor <init>(Landroid/media/MediaRouter$VolumeCallback;Landroid/media/MediaRouter$RouteInfo;)V
    .locals 0
    .parameter "vcb"
    .parameter "route"

    .prologue
    .line 2227
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2228
    iput-object p1, p0, Landroid/media/MediaRouter$VolumeCallbackInfo;->vcb:Landroid/media/MediaRouter$VolumeCallback;

    .line 2229
    iput-object p2, p0, Landroid/media/MediaRouter$VolumeCallbackInfo;->route:Landroid/media/MediaRouter$RouteInfo;

    .line 2230
    return-void
.end method
