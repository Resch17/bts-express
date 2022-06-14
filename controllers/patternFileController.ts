import { PrismaClient } from '@prisma/client';
import { Blob } from 'buffer';
import express from 'express';
import multer from 'multer';

const upload = multer();

const router = express.Router();

const prisma = new PrismaClient();

router.post('/:patternid/file/:filename', async (req, res) => {
    const { patternid, filename } = req.params;

    try {
        const file = req.body;
        if (file) {
            console.log('file', file);
            await prisma.patternfile.create({
                data: {
                    name: filename,
                    bytes: Buffer.from(file),
                    patternid: parseInt(patternid),
                },
            });
            res.status(201).json();
        } else {
            throw new Error('No file receieved');
        }
    } catch (err) {
        console.error(err);
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const patternFile = await prisma.patternfile.findUnique({
        where: { id: Number(id) },
    });
    if (patternFile !== null) {
        res.writeHead(200, {
            'Content-Type': 'application/pdf',
            'Content-Length': patternFile.bytes.length,
            'Content-Disposition': 'attachment; filename=' + patternFile.name,
        });
        res.end(Buffer.from(patternFile.bytes));
    } else {
        res.status(404).json({ message: 'No pattern file found' });
    }
});

router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.patternfile.delete({
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json();
    }
});

export default router;
