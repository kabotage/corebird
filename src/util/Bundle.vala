/*  This file is part of corebird, a Gtk+ linux Twitter client.
 *  Copyright (C) 2013 Timm Bäder
 *
 *  corebird is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  corebird is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with corebird.  If not, see <http://www.gnu.org/licenses/>.
 */

public class Bundle : GLib.Object {
  private GLib.HashTable<string, GLib.Value?> values;

  public Bundle () {
    this.values = new GLib.HashTable<string, GLib.Value?> (str_hash, str_equal);
  }

  public void put_string (string key, string value) {
    var v = GLib.Value (typeof (string));
    v.set_string (value);
    values.insert (key, v);
  }

  public string? get_string (string key) {
    var v = this.values.get (key);
    if (v != null)
      return v.get_string ();

    return null;
  }

  public void put_int64 (string key, int64 value) {
    var v = GLib.Value (typeof (int64));
    v.set_int64 (value);
    values.insert (key, v);
  }

  public int64 get_int64 (string key) {
    return this.values.get (key).get_int64 ();
  }

  public void put_int (string key, int value) {
    var v = GLib.Value (typeof (int));
    v.set_int (value);
    values.insert (key, v);
  }

  public int get_int (string key) {
    return values.get (key).get_int ();
  }

  public void put_object (string key, GLib.Object object) {
    var v = GLib.Value (typeof (GLib.Object));
    v.set_object (object);
    values.insert (key, v);
  }

  public GLib.Object? get_object (string key) {
    return values.get (key).get_object ();
  }

  public void put_bool (string key, bool value) {
    var v = GLib.Value (typeof (bool));
    v.set_boolean (value);
    values.insert (key, v);
  }

  public bool get_bool (string key) {
    return this.values.get (key).get_boolean ();
  }
}
