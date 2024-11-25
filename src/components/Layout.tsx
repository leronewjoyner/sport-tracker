import Link from 'next/link';

const Layout = ({ children }: { children: React.ReactNode }) => {
  return (
    <div className="min-h-screen flex flex-col bg-gray-50">
      {/* Header */}
      <header className="bg-blue-600 text-white shadow-lg">
        <div className="max-w-7xl mx-auto px-4 py-3 flex justify-between items-center">
          <h1 className="text-lg font-bold tracking-wide">Sport Tracker</h1>
          <div className="flex space-x-4">
            <Link href="/" className="bg-white text-blue-600 py-2 px-4 rounded-lg hover:bg-gray-200 transition">
              View Stats
            </Link>
            <Link href="/enter-stats" className="bg-white text-blue-600 py-2 px-4 rounded-lg hover:bg-gray-200 transition">
              Enter Game Stats
            </Link>
          </div>
        </div>
      </header>

      {/* Page Content */}
      <main className="flex-grow">{children}</main>

      {/* Footer (Optional) */}
      <footer className="bg-gray-800 text-white py-4 text-center">
        <p className="text-sm">&copy; COSC 459 Group 8</p>
      </footer>
    </div>
  );
};

export default Layout;
