import Image from "next/image";

export default function Home() {
  return (
    <div className="flex items-center justify-center flex-col h-screen">
      <Image src="/img/autolycus.png" alt="hero" width={500} height={500} />
      <p>Autocylus is the son of Hermes</p>
    </div>
  );
}
