// Navigation pane project template
#ifndef RocknRoll_HPP_
#define RocknRoll_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class RocknRoll : public QObject
{
    Q_OBJECT
public:
    RocknRoll(bb::cascades::Application *app);
    virtual ~RocknRoll() {}

    void startNetworkManager();
    void parseJSON();

public slots:
	void onArtistReply();

signals:
	void complete(QString info, bool success);
};

#endif /* RocknRoll_HPP_ */
