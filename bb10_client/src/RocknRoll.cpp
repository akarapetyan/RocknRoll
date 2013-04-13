// Navigation pane project template
#include "RocknRoll.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/SceneCover>

#include "albumsmodel.hpp"
#include "songsmodel.hpp"

using namespace bb::cascades;

RocknRoll::RocknRoll(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    AlbumsDataModel *p1DataModel = new AlbumsDataModel(this);
    SongsDataModel *p2DataModel = new SongsDataModel(this);
    qml->setContextProperty("_model1", p1DataModel);
    qml->setContextProperty("_model2", p2DataModel);

    qmlRegisterType<SceneCover>("bb.cascades", 1, 0, "SceneCover");
    qmlRegisterUncreatableType<AbstractCover>("bb.cascades", 1, 0, "AbstractCover", "An AbstractCover cannot be created.");

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // set created root object as a scene
    app->setScene(root);
}
