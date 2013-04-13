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
};

#endif /* RocknRoll_HPP_ */