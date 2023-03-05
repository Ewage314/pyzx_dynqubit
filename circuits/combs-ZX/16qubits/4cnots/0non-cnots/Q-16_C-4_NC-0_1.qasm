OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[7];
cx q[7], q[15];
cx q[15], q[11];
cx q[12], q[2];
