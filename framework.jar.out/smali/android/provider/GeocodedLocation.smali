.class public Landroid/provider/GeocodedLocation;
.super Ljava/lang/Object;
.source "GeocodedLocation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/provider/GeocodedLocation$PhoneNumber;,
        Landroid/provider/GeocodedLocation$Section;,
        Landroid/provider/GeocodedLocation$AreaCode;,
        Landroid/provider/GeocodedLocation$Area;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "geocoded_location"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final PATH:Ljava/lang/String; = "location"

.field public static final TYPE_LANDLINE:I = 0x0

.field public static final TYPE_MOBILE:I = 0x1


# instance fields
.field private mAreaCode:Landroid/provider/GeocodedLocation$AreaCode;

.field private mType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-string v0, "content://geocoded_location/location"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/GeocodedLocation;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;I)V
    .locals 1
    .parameter "c"
    .parameter "type"

    .prologue
    .line 172
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 173
    new-instance v0, Landroid/provider/GeocodedLocation$AreaCode;

    invoke-direct {v0, p1}, Landroid/provider/GeocodedLocation$AreaCode;-><init>(Landroid/database/Cursor;)V

    iput-object v0, p0, Landroid/provider/GeocodedLocation;->mAreaCode:Landroid/provider/GeocodedLocation$AreaCode;

    .line 174
    iput p2, p0, Landroid/provider/GeocodedLocation;->mType:I

    .line 175
    return-void
.end method

.method public static getLocation(Landroid/content/Context;Ljava/lang/String;)Landroid/provider/GeocodedLocation;
    .locals 12
    .parameter "context"
    .parameter "number"

    .prologue
    const/4 v1, 0x1

    .line 273
    const/4 v8, 0x0

    .line 275
    .local v8, location:Landroid/provider/GeocodedLocation;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v9, v8

    .line 310
    .end local v8           #location:Landroid/provider/GeocodedLocation;
    .local v9, location:Landroid/provider/GeocodedLocation;
    :goto_0
    return-object v9

    .line 279
    .end local v9           #location:Landroid/provider/GeocodedLocation;
    .restart local v8       #location:Landroid/provider/GeocodedLocation;
    :cond_0
    #calls: Landroid/provider/GeocodedLocation$PhoneNumber;->getActualPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Landroid/provider/GeocodedLocation$PhoneNumber;
    invoke-static {p0, p1}, Landroid/provider/GeocodedLocation$PhoneNumber;->access$000(Landroid/content/Context;Ljava/lang/String;)Landroid/provider/GeocodedLocation$PhoneNumber;

    move-result-object v10

    .line 280
    .local v10, phoneNumber:Landroid/provider/GeocodedLocation$PhoneNumber;
    if-nez v10, :cond_1

    move-object v9, v8

    .line 281
    .end local v8           #location:Landroid/provider/GeocodedLocation;
    .restart local v9       #location:Landroid/provider/GeocodedLocation;
    goto :goto_0

    .line 284
    .end local v9           #location:Landroid/provider/GeocodedLocation;
    .restart local v8       #location:Landroid/provider/GeocodedLocation;
    :cond_1
    const/4 v6, 0x0

    .line 286
    .local v6, c:Landroid/database/Cursor;
    :try_start_0
    #getter for: Landroid/provider/GeocodedLocation$PhoneNumber;->type:I
    invoke-static {v10}, Landroid/provider/GeocodedLocation$PhoneNumber;->access$100(Landroid/provider/GeocodedLocation$PhoneNumber;)I

    move-result v0

    if-nez v0, :cond_5

    .line 288
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/GeocodedLocation;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const-string v3, "code=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    #getter for: Landroid/provider/GeocodedLocation$PhoneNumber;->actualNumber:Ljava/lang/String;
    invoke-static {v10}, Landroid/provider/GeocodedLocation$PhoneNumber;->access$200(Landroid/provider/GeocodedLocation$PhoneNumber;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 300
    :cond_2
    :goto_1
    if-eqz v6, :cond_3

    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 301
    new-instance v9, Landroid/provider/GeocodedLocation;

    #getter for: Landroid/provider/GeocodedLocation$PhoneNumber;->type:I
    invoke-static {v10}, Landroid/provider/GeocodedLocation$PhoneNumber;->access$100(Landroid/provider/GeocodedLocation$PhoneNumber;)I

    move-result v0

    invoke-direct {v9, v6, v0}, Landroid/provider/GeocodedLocation;-><init>(Landroid/database/Cursor;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v8           #location:Landroid/provider/GeocodedLocation;
    .restart local v9       #location:Landroid/provider/GeocodedLocation;
    move-object v8, v9

    .line 306
    .end local v9           #location:Landroid/provider/GeocodedLocation;
    .restart local v8       #location:Landroid/provider/GeocodedLocation;
    :cond_3
    if-eqz v6, :cond_4

    invoke-interface {v6}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_4

    .line 307
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    :goto_2
    move-object v9, v8

    .line 310
    .end local v8           #location:Landroid/provider/GeocodedLocation;
    .restart local v9       #location:Landroid/provider/GeocodedLocation;
    goto :goto_0

    .line 292
    .end local v9           #location:Landroid/provider/GeocodedLocation;
    .restart local v8       #location:Landroid/provider/GeocodedLocation;
    :cond_5
    :try_start_1
    #getter for: Landroid/provider/GeocodedLocation$PhoneNumber;->type:I
    invoke-static {v10}, Landroid/provider/GeocodedLocation$PhoneNumber;->access$100(Landroid/provider/GeocodedLocation$PhoneNumber;)I

    move-result v0

    if-ne v0, v1, :cond_2

    .line 294
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/GeocodedLocation;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const-string/jumbo v3, "number1<=? and number2>=?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    #getter for: Landroid/provider/GeocodedLocation$PhoneNumber;->actualNumber:Ljava/lang/String;
    invoke-static {v10}, Landroid/provider/GeocodedLocation$PhoneNumber;->access$200(Landroid/provider/GeocodedLocation$PhoneNumber;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v4, v5

    const/4 v5, 0x1

    #getter for: Landroid/provider/GeocodedLocation$PhoneNumber;->actualNumber:Ljava/lang/String;
    invoke-static {v10}, Landroid/provider/GeocodedLocation$PhoneNumber;->access$200(Landroid/provider/GeocodedLocation$PhoneNumber;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    goto :goto_1

    .line 303
    :catch_0
    move-exception v7

    .line 304
    .local v7, e:Landroid/database/sqlite/SQLiteException;
    :try_start_2
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 306
    if-eqz v6, :cond_4

    invoke-interface {v6}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_4

    .line 307
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 306
    .end local v7           #e:Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_6

    invoke-interface {v6}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_6

    .line 307
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_6
    throw v0
.end method


# virtual methods
.method public getAreaCode()Landroid/provider/GeocodedLocation$AreaCode;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Landroid/provider/GeocodedLocation;->mAreaCode:Landroid/provider/GeocodedLocation$AreaCode;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 182
    iget v0, p0, Landroid/provider/GeocodedLocation;->mType:I

    return v0
.end method
