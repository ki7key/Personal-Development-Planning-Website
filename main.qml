import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 1000
    height: 600
    title: "个人发展规划网站"

    Rectangle {
        anchors.fill: parent
        color: "#f8fafc"

        Row {
            anchors.fill: parent

            // ===== 左侧栏 =====
            Rectangle {
                width: 220
                height: parent.height
                color: "#d1d5db"
                Column {
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 20

                    // 头像
                    Rectangle {
                        width: 80
                        height: 80
                        radius: 40
                        color: "#9ca3af"
                        Text {
                            anchors.centerIn: parent
                            text: "U"
                            color: "white"
                            font.pixelSize: 30
                            font.bold: true
                        }
                    }

                    // 用户名
                    Text {
                        text: "你的名字"
                        color: "#111827"
                        font.pixelSize: 18
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                    }

                    Rectangle {
                        width: 150
                        height: 1
                        color: "#9ca3af"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    // 功能导航
                    Column {
                        spacing: 15
                        Repeater {
                            model: ["课程", "竞赛/项目", "GPA", "目标", "简历", "建议"]
                            delegate: Rectangle {
                                width: 180
                                height: 40
                                radius: 8
                                color: "#cbd5e1"
                                Text {
                                    anchors.centerIn: parent
                                    text: modelData
                                    color: "#111827"
                                    font.pixelSize: 14
                                    font.bold: true
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: console.log("点击：" + modelData)
                                    hoverEnabled: true
                                    onEntered: parent.color = "#93c5fd"
                                    onExited: parent.color = "#cbd5e1"
                                }
                            }
                        }
                    }
                }
            }

            //右侧内容区
            Rectangle {
                width: parent.width - 220
                height: parent.height
                color: "#f8fafc"

                Column {
                    anchors.fill: parent
                    anchors.margins: 50
                    spacing: 20

                    // 欢迎标题
                    Text {
                        text: "欢迎来到个人发展规划网站👋"
                        font.pixelSize: 26
                        color: "#1f2937"
                        font.bold: true
                    }

                    Text {
                        text: "请开启你的成长之旅"
                        font.pixelSize: 16
                        color: "#4b5563"
                        font.bold: true
                    }
                    Rectangle {
                        height: 30
                        color: "transparent"
                        width: 1
                    } //让卡片居中

                    // 功能卡片区域
                    Grid {
                        id: cardGrid
                        columns: 3
                        rowSpacing: 20
                        columnSpacing: 20

                        Repeater {
                            model: [{
                                    title: "课程管理",
                                    gradientStart: "#93c5fd",
                                    gradientEnd: "#60a5fa"
                                }, {
                                    title: "竞赛经历",
                                    gradientStart: "#6ee7b7",
                                    gradientEnd: "#34d399"
                                }, {
                                    title: "GPA计算",
                                    gradientStart: "#fde68a",
                                    gradientEnd: "#fcd34d"
                                }, {
                                    title: "目标规划",
                                    gradientStart: "#c084fc",
                                    gradientEnd: "#a78bfa"
                                }, {
                                    title: "简历导出",
                                    gradientStart: "#fca5a5",
                                    gradientEnd: "#f87171"
                                }, {
                                    title: "智能建议",
                                    gradientStart: "#67e8f9",
                                    gradientEnd: "#22d3ee"
                                }]
                            delegate: Rectangle {
                                width: 220
                                height: 120
                                radius: 12
                                border.color: "#ffffff"
                                border.width: 1

                                gradient: Gradient {
                                    GradientStop {
                                        position: 0
                                        color: modelData.gradientStart
                                    }
                                    GradientStop {
                                        position: 1
                                        color: modelData.gradientEnd
                                    }
                                }

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 10
                                    Text {
                                        text: modelData.title
                                        color: "white"
                                        font.pixelSize: 18
                                        font.bold: true
                                    }
                                    Text {
                                        text: "点击进入"
                                        color: "#f3f4f6"
                                        font.pixelSize: 12
                                        font.bold: true
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: console.log(
                                                   "进入：" + modelData.title)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
