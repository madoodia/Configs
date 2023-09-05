/* --------------------- */
/* (C) 2020 madoodia.com */
/* --------------------- */

#include "glrenderer.h"

GLRenderer::GLRenderer()
    : mProgram(nullptr), mixValue(0.2f), xRot(1.0f), yRot(1.0f),
      zRot(1.0f), xvRot(0.0f), yvRot(1.0f),
      zvRot(0.0f), xPan(0.0f), yPan(0.0f),
      zPan(-1.0f), fov(45.0f), cameraSpeed(0.05f),
      interval(1.0f), nbFrames(100.0f)
{
  // qApp->installEventFilter(this);
  // QObject::installEventFilter(this);

  // setClearBeforeRendering(false);
  // QSurfaceFormat format = QSurfaceFormat::defaultFormat();
  // format.setVersion(3, 3);
  // format.setProfile(QSurfaceFormat::CoreProfile);
  // setFormat(format);
  mDeltaTime = std::chrono::duration<double>(0.0);
  mPrevTime = std::chrono::steady_clock::now();
  mCurrentTime = std::chrono::steady_clock::now();
}

GLRenderer::~GLRenderer()
{
  delete mProgram;
}

void GLRenderer::initializeGL()
{
  qDebug("--= initializeGL started\n");

  if (glewInit() != GLEW_OK)
  {
    qDebug("Glew is not initialized!");
    // close();
  }

  qDebug("OpenGL version: %s\n", glGetString(GL_VERSION));
  int nrAttributes;
  glGetIntegerv(GL_MAX_VERTEX_ATTRIBS, &nrAttributes);
  qDebug("OpenGL Max Vertex Attribs: %d\n", nrAttributes);

  glViewport(mPos.x(), mPos.y(), mViewportSize.width(), mViewportSize.height());

  mProgram = new Shader();
  mProgram->addShaders("shaders/cube.vert", "shaders/cube.frag");

  // Vertex Data
  GLfloat vertices[] = {
      -0.5f, -0.5f, -0.5f, 0.0f, 0.0f,
      0.5f, -0.5f, -0.5f, 1.0f, 0.0f,
      0.5f, 0.5f, -0.5f, 1.0f, 1.0f,
      0.5f, 0.5f, -0.5f, 1.0f, 1.0f,
      -0.5f, 0.5f, -0.5f, 0.0f, 1.0f,
      -0.5f, -0.5f, -0.5f, 0.0f, 0.0f,

      -0.5f, -0.5f, 0.5f, 0.0f, 0.0f,
      0.5f, -0.5f, 0.5f, 1.0f, 0.0f,
      0.5f, 0.5f, 0.5f, 1.0f, 1.0f,
      0.5f, 0.5f, 0.5f, 1.0f, 1.0f,
      -0.5f, 0.5f, 0.5f, 0.0f, 1.0f,
      -0.5f, -0.5f, 0.5f, 0.0f, 0.0f,

      -0.5f, 0.5f, 0.5f, 1.0f, 0.0f,
      -0.5f, 0.5f, -0.5f, 1.0f, 1.0f,
      -0.5f, -0.5f, -0.5f, 0.0f, 1.0f,
      -0.5f, -0.5f, -0.5f, 0.0f, 1.0f,
      -0.5f, -0.5f, 0.5f, 0.0f, 0.0f,
      -0.5f, 0.5f, 0.5f, 1.0f, 0.0f,

      0.5f, 0.5f, 0.5f, 1.0f, 0.0f,
      0.5f, 0.5f, -0.5f, 1.0f, 1.0f,
      0.5f, -0.5f, -0.5f, 0.0f, 1.0f,
      0.5f, -0.5f, -0.5f, 0.0f, 1.0f,
      0.5f, -0.5f, 0.5f, 0.0f, 0.0f,
      0.5f, 0.5f, 0.5f, 1.0f, 0.0f,

      -0.5f, -0.5f, -0.5f, 0.0f, 1.0f,
      0.5f, -0.5f, -0.5f, 1.0f, 1.0f,
      0.5f, -0.5f, 0.5f, 1.0f, 0.0f,
      0.5f, -0.5f, 0.5f, 1.0f, 0.0f,
      -0.5f, -0.5f, 0.5f, 0.0f, 0.0f,
      -0.5f, -0.5f, -0.5f, 0.0f, 1.0f,

      -0.5f, 0.5f, -0.5f, 0.0f, 1.0f,
      0.5f, 0.5f, -0.5f, 1.0f, 1.0f,
      0.5f, 0.5f, 0.5f, 1.0f, 0.0f,
      0.5f, 0.5f, 0.5f, 1.0f, 0.0f,
      -0.5f, 0.5f, 0.5f, 0.0f, 0.0f,
      -0.5f, 0.5f, -0.5f, 0.0f, 1.0f};

  glGenVertexArrays(1, &vao);
  glGenBuffers(1, &vbo);

  glBindVertexArray(vao);

  glBindBuffer(GL_ARRAY_BUFFER, vbo);
  glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)0);
  glEnableVertexAttribArray(0);

  glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)(3 * sizeof(float)));
  glEnableVertexAttribArray(1);

  glBindBuffer(GL_ARRAY_BUFFER, 0);
  glBindVertexArray(0);

  // TODO: activating this line, makes all the QML GUI and viewport be in wireframe mode, that is weird
  // glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);

  // load and create textures
  int w, h, nrChannels;

  glGenTextures(1, &texture1);
  glBindTexture(GL_TEXTURE_2D, texture1);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  // stbi_set_flip_vertically_on_load(true);
  unsigned char* data = stbi_load("textures/container.jpg", &w, &h, &nrChannels, 0);
  if (data)
  {
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, w, h, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
    glGenerateMipmap(GL_TEXTURE_2D);
  }
  else
  {
    qDebug("Failed to load texture!\n");
  }
  stbi_image_free(data);

  glGenTextures(1, &texture2);
  glBindTexture(GL_TEXTURE_2D, texture2);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  // stbi_set_flip_vertically_on_load(true);
  data = stbi_load("textures/awesomeface.png", &w, &h, &nrChannels, 0);
  if (data)
  {
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
    glGenerateMipmap(GL_TEXTURE_2D);
  }
  else
  {
    qDebug("Failed to load texture!\n");
  }
  stbi_image_free(data);

  mProgram->use();

  glUniform1i(glGetUniformLocation(mProgram->getID(), "texture1"), 0);
  glUniform1i(glGetUniformLocation(mProgram->getID(), "texture2"), 1);
  glUniform1f(glGetUniformLocation(mProgram->getID(), "mixValue"), mixValue);

  // Camera
  cameraPos = QVector3D(0.0f, 0.0f, 7.0f);
  cameraFront = QVector3D(0.0f, 0.0f, -1.0f);

  cameraDirection = (cameraPos - cameraFront).normalized();
  QVector3D tempUp(0.0f, 1.0f, 0.0f);
  cameraRight = QVector3D::crossProduct(cameraDirection, tempUp).normalized();
  cameraUp = QVector3D::crossProduct(cameraDirection, cameraRight);

  qDebug("--= initializeGL finished\n");
}

void GLRenderer::paintGL()
{

  // initializeGL();
  if (!mProgram)
  {
    // QSGRendererInterface *rif = mWindow->rendererInterface();
    // Q_ASSERT(rif->graphicsApi() == QSGRendererInterface::OpenGL || rif->graphicsApi() == QSGRendererInterface::OpenGLRhi);
    initializeGL();
    qDebug("--= paintGL:mProgram: %d\n", mProgram);
  }

  // mWindow->beginExternalCommands();

  glClearColor(0.2f, 0.3f, 0.4f, 1.0f);
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  glViewport(mPos.x(), mPos.y(), mViewportSize.width(), mViewportSize.height());

  glEnable(GL_DEPTH_TEST);

  glActiveTexture(GL_TEXTURE0);
  glBindTexture(GL_TEXTURE_2D, texture1);
  glActiveTexture(GL_TEXTURE1);
  glBindTexture(GL_TEXTURE_2D, texture2);

  mProgram->use();
  glUniform1f(glGetUniformLocation(mProgram->getID(), "mixValue"), mixValue);

  QMatrix4x4 view;
  QMatrix4x4 projection;

  view.lookAt(cameraPos, cameraPos + cameraFront, cameraUp);
  view.translate(QVector3D(xPan, yPan, zPan));
  view.rotate(xvRot, QVector3D(1.0f, 0.0f, 0.0f));
  view.rotate(yvRot, QVector3D(0.0f, 1.0f, 0.0f));

  projection.perspective(fov, (float)mViewportSize.width() / (float)mViewportSize.height(), 0.1f, 100.0f);

  modelLocation = glGetUniformLocation(mProgram->getID(), "model");
  viewLocation = glGetUniformLocation(mProgram->getID(), "view");
  projectionLocation = glGetUniformLocation(mProgram->getID(), "projection");

  glUniformMatrix4fv(viewLocation, 1, GL_FALSE, view.data());
  glUniformMatrix4fv(projectionLocation, 1, GL_FALSE, projection.data());

  QVector3D cubePosition = QVector3D(0.0f, 0.0f, -1.0f);

  glBindVertexArray(vao);

  QMatrix4x4 model;
  model.translate(cubePosition);
  model.rotate((xRot * 1), QVector3D(1.0f, 0.0f, 0.0f));
  model.rotate((yRot * 1), QVector3D(0.0f, 1.0f, 0.0f));
  model.rotate((zRot * 1), QVector3D(0.0f, 0.0f, 1.0f));
  model.scale(QVector3D(3.0f, 3.0f, 3.0f));
  glUniformMatrix4fv(modelLocation, 1, GL_FALSE, model.data());

  glDrawArrays(GL_TRIANGLES, 0, 36);

  // glBindVertexArray(0); // no need to unbind for one object

  mWindow->resetOpenGLState();
  mWindow->update();
  // mWindow->endExternalCommands();
}

void GLRenderer::mousePressEvent(QMouseEvent* me)
{
  QEvent* e = static_cast<QEvent*>(me);
  QKeyEvent* ke = static_cast<QKeyEvent*>(e);

  if (ke->modifiers() == Qt::Modifier::ALT)
  {
    if (me->buttons())
    {
      mousePos = QVector2D(me->localPos());
    }
  }
}

void GLRenderer::mouseReleaseEvent(QMouseEvent* me)
{
}

void GLRenderer::mouseMoveEvent(QMouseEvent* me)
{
  // qDebug() << "GLRenderer::mouseMoveEvent";

  QEvent* e = static_cast<QEvent*>(me);
  QKeyEvent* ke = static_cast<QKeyEvent*>(e);

  if (ke->modifiers() == Qt::Modifier::ALT)
  {
    if (me->buttons() & Qt::LeftButton)
    {
      // // Calculate Delta Time
      // mPrevTime = mCurrentTime;
      // mCurrentTime = std::chrono::steady_clock::now();

      // mDeltaTime = std::chrono::duration<double>(mCurrentTime - mPrevTime);
      // // qDebug() << mDeltaTime.count();
      // if (mDeltaTime.count() > 2.0)
      //   mDeltaTime = std::chrono::duration<double>(2.0);

      QVector2D currentPos = QVector2D(me->localPos());

      float xOffset = currentPos.x() - mousePos.x();
      float yOffset = currentPos.y() - mousePos.y();

      xvRot -= yOffset;
      yvRot -= xOffset;

      mousePos = currentPos;

      mWindow->update();
    }
    if (me->buttons() & Qt::MidButton)
    {
      // Calculate Delta Time
      mPrevTime = mCurrentTime;
      mCurrentTime = std::chrono::steady_clock::now();

      mDeltaTime = std::chrono::duration<double>(mCurrentTime - mPrevTime);
      // qDebug() << mDeltaTime.count();
      if (mDeltaTime.count() > .1)
        mDeltaTime = std::chrono::duration<double>(.1);

      QVector2D currentPos = QVector2D(me->localPos());

      float xOffset = currentPos.x() - mousePos.x();
      float yOffset = currentPos.y() - mousePos.y();
      xPan -= xOffset * mDeltaTime.count();
      yPan += yOffset * mDeltaTime.count();

      mousePos = currentPos;

      mWindow->update();
    }
    if (me->buttons() & Qt::RightButton)
    {
      // Calculate Delta Time
      mPrevTime = mCurrentTime;
      mCurrentTime = std::chrono::steady_clock::now();

      mDeltaTime = std::chrono::duration<double>(mCurrentTime - mPrevTime);
      // qDebug() << mDeltaTime.count();
      if (mDeltaTime.count() > .1)
        mDeltaTime = std::chrono::duration<double>(.1);

      QVector2D currentPos = QVector2D(me->localPos());

      float xOffset = currentPos.x() - mousePos.x();
      // yOffset = currentPos.y() - mousePos.y();
      zPan += xOffset * mDeltaTime.count();

      mousePos = currentPos;

      mWindow->update();
    }
  }
}

void GLRenderer::hoverMoveEvent(QHoverEvent* me)
{
  // qDebug() << "GLRenderer::hoverMoveEvent";
}

void GLRenderer::keyPressEvent(QKeyEvent* ke)
{
  // qDebug() << "GLRenderer::keyPressEvent";
}

void GLRenderer::wheelEvent(QWheelEvent* we)
{
  // qDebug() << "GLRenderer::wheelEvent";
  // qDebug() << "Weel Event Delta : " << we->angleDelta();
  // qDebug() << "Weel Event Delta : " << we->pixelDelta();
  // qDebug() << "Buttons : " << we->buttons();
  // qDebug() << " x : " << we->position().x() << ", y : " << we->position().y();
  // qDebug() << " Orientation : " << we->orientation();

  QEvent* e = static_cast<QEvent*>(we);
  QKeyEvent* ke = static_cast<QKeyEvent*>(e);

  if (ke->modifiers() == Qt::Modifier::ALT)
  {
    // Calculate Delta Time
    mPrevTime = mCurrentTime;
    mCurrentTime = std::chrono::steady_clock::now();

    mDeltaTime = std::chrono::duration<double>(mCurrentTime - mPrevTime);
    // qDebug() << mDeltaTime.count();
    if (mDeltaTime.count() > 0.01)
      mDeltaTime = std::chrono::duration<double>(0.01);

    zPan += (float)we->angleDelta().x() * mDeltaTime.count();

    mWindow->update();
  }
}

// bool GLRenderer::event(QEvent *event)
// {
//   QMouseEvent *me = static_cast<QMouseEvent *>(event);
//   if (me->buttons() & Qt::LeftButton){
//     qDebug() << "GLRenderer::event";
//     return true;
//   }

//   return QObject::event(event);
// }