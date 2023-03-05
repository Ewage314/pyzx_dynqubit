OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[3];
cx q[7], q[2];
cx q[8], q[15];
cx q[6], q[15];
