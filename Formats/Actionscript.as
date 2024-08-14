package {
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    public class Program extends Sprite {
        public static var Number:uint = 0;
        public static var Number2:uint = 0;
        public static var Number3:uint = uint.MAX_VALUE;

        public function Program() {
            var file:File = File.applicationStorageDirectory.resolvePath("File.txt");
            if (!file.exists) {
                var stream:FileStream = new FileStream();
                stream.open(file, FileMode.WRITE);
                stream.writeUTFBytes("Goodbye Cruel World!");
                stream.close();
            }

            trace("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
            stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        }

        private function onKeyDown(event:KeyboardEvent):void {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            End();
        }

        public static function End():void {
            var file:File = File.applicationStorageDirectory.resolvePath("File.txt");
            var stream:FileStream = new FileStream();
            stream.open(file, FileMode.READ);
            var contents:String = stream.readUTFBytes(stream.bytesAvailable);
            stream.close();

            for (Number = 0; Number < Number3; Number2++) {
                stream = new FileStream();
                stream.open(file, FileMode.APPEND);
                stream.writeUTFBytes(contents);
                stream.close();

                trace("\r" + (Number2 + 1).toString());
                // Note: ActionScript doesn't have a direct equivalent to Console.Title
                
                var file2:File = File.applicationStorageDirectory.resolvePath("File (" + Number2 + ").txt");
                file.copyTo(file2);
                file = file2;
            }

            trace();
        }
    }
}

