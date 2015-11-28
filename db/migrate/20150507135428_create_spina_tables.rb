class CreateSpinaTables < ActiveRecord::Migration
  def change
    create_table "spina_accounts", force: :cascade do |t|
      t.string   "name"
      t.string   "address"
      t.string   "postal_code"
      t.string   "city"
      t.string   "phone"
      t.string   "email"
      t.text     "preferences"
      t.string   "logo"
      t.datetime "created_at",                     null: false
      t.datetime "updated_at",                     null: false
      t.string   "kvk_identifier"
      t.string   "vat_identifier"
      t.boolean  "robots_allowed", default: false
    end

    create_table "spina_attachment_collections", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "spina_attachment_collections_attachments", force: :cascade do |t|
      t.integer "attachment_collection_id"
      t.integer "attachment_id"
    end

    create_table "spina_attachments", force: :cascade do |t|
      t.string   "file"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "spina_colors", force: :cascade do |t|
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_inquiries", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.string   "phone"
      t.text     "message"
      t.boolean  "archived",   default: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
      t.boolean  "spam"
    end

    create_table "spina_layout_parts", force: :cascade do |t|
      t.string   "title"
      t.string   "name"
      t.integer  "layout_partable_id"
      t.string   "layout_partable_type"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "account_id"
    end

    create_table "spina_lines", force: :cascade do |t|
      t.string   "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_page_parts", force: :cascade do |t|
      t.string   "title"
      t.string   "name"
      t.datetime "created_at",         null: false
      t.datetime "updated_at",         null: false
      t.integer  "page_id"
      t.integer  "page_partable_id"
      t.string   "page_partable_type"
    end

    create_table "spina_pages", force: :cascade do |t|
      t.string   "title"
      t.string   "menu_title"
      t.string   "description"
      t.boolean  "show_in_menu",        default: true
      t.string   "slug"
      t.boolean  "deletable",           default: true
      t.datetime "created_at",                          null: false
      t.datetime "updated_at",                          null: false
      t.string   "name"
      t.string   "seo_title"
      t.boolean  "skip_to_first_child", default: false
      t.string   "view_template"
      t.string   "layout_template"
      t.boolean  "draft",               default: false
      t.string   "link_url"
      t.string   "ancestry"
      t.integer  "position"
      t.string   "materialized_path"
      t.boolean  "active",              default: true
    end

    create_table "spina_photo_collections", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "spina_photo_collections_photos", force: :cascade do |t|
      t.integer "photo_collection_id"
      t.integer "photo_id"
      t.integer "position"
    end

    create_table "spina_photos", force: :cascade do |t|
      t.string   "file"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "spina_structure_items", force: :cascade do |t|
      t.integer  "structure_id"
      t.integer  "position"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "spina_structure_items", ["structure_id"], name: "index_spina_structure_items_on_structure_id", using: :btree

    create_table "spina_structure_parts", force: :cascade do |t|
      t.integer  "structure_item_id"
      t.integer  "structure_partable_id"
      t.string   "structure_partable_type"
      t.string   "name"
      t.string   "title"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "spina_structure_parts", ["structure_item_id"], name: "index_spina_structure_parts_on_structure_item_id", using: :btree
    add_index "spina_structure_parts", ["structure_partable_id"], name: "index_spina_structure_parts_on_structure_partable_id", using: :btree

    create_table "spina_structures", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_texts", force: :cascade do |t|
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_users", force: :cascade do |t|
      t.string   "name"
      t.boolean  "admin",           default: false
      
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :spina_users, :email,                unique: true
    add_index :spina_users, :reset_password_token, unique: true
    # add_index :spina_users, :confirmation_token,   unique: true
    # add_index :spina_users, :unlock_token,         unique: true
  end
end
