// Navigation pane project template
#include "RocknRoll.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include "albumsmodel.hpp"

using namespace bb::cascades;

RocknRoll::RocknRoll(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    AlbumsDataModel *pDataModel = new AlbumsDataModel(this);
    qml->setContextProperty("_model", pDataModel);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // set created root object as a scene
    app->setScene(root);
}
