.class public Landroid/view/ViewGroupOverlay;
.super Landroid/view/ViewOverlay;
.source "ViewGroupOverlay.java"


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .locals 0
    .parameter "context"
    .parameter "hostView"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Landroid/view/ViewOverlay;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 37
    return-void
.end method


# virtual methods
.method public add(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 63
    iget-object v0, p0, Landroid/view/ViewOverlay;->mOverlayViewGroup:Landroid/view/ViewOverlay$OverlayViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewOverlay$OverlayViewGroup;->add(Landroid/view/View;)V

    .line 64
    return-void
.end method

.method public remove(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 74
    iget-object v0, p0, Landroid/view/ViewOverlay;->mOverlayViewGroup:Landroid/view/ViewOverlay$OverlayViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewOverlay$OverlayViewGroup;->remove(Landroid/view/View;)V

    .line 75
    return-void
.end method
