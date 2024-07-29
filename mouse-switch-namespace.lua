-- 切换到上一个空间
function switchToPreviousSpace()
    hs.osascript.applescript([[
        tell application "System Events"
            key code 123 using control down
        end tell
    ]])
end

-- 切换到下一个空间
function switchToNextSpace()
    hs.osascript.applescript([[
        tell application "System Events"
            key code 124 using control down
        end tell
    ]])
end

-- 创建一个鼠标点击事件监听器
mouseEvent = hs.eventtap.new({hs.eventtap.event.types.otherMouseDown}, function(event)
    -- 获取鼠标按钮编号
    local buttonNumber = event:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])
    
    if buttonNumber == 3 then  
        -- 切换到下一个空间
        switchToNextSpace()

        -- 吞掉原始事件，防止其继续传播
        return true
    elseif buttonNumber == 4 then  
        -- 切换到上一个空间
        switchToPreviousSpace()

        -- 吞掉原始事件，防止其继续传播
        return true
    end

    -- 如果不是鼠标5号键或3号键，允许事件继续传播
    return false
end)

-- 开始监听鼠标点击事件
mouseEvent:start()
